#!/bin/bash

# Script Name: openfaas_port_forward.sh
# Description: Waits for all OpenFaaS pods to be in the Running and Ready state before port-forwarding the gateway.
# Usage: ./openfaas_port_forward.sh

# Configuration
NAMESPACE="openfaas"
GATEWAY_SERVICE="gateway"
LOCAL_PORT=8080
REMOTE_PORT=8080
CHECK_INTERVAL=10    # Seconds between status checks
TIMEOUT=600          # Maximum wait time in seconds (e.g., 10 minutes)

# Function to check if all pods are running and ready
check_pods_ready() {
    # Get total number of pods
    TOTAL_PODS=$(microk8s kubectl get pods -n "$NAMESPACE" --no-headers | wc -l)
    
    # Get number of pods that are Running and Ready
    READY_PODS=$(microk8s kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running \
        -o jsonpath='{.items[*].status.containerStatuses[*].ready}' | tr ' ' '\n' | grep -c true)
    
    # Each pod typically has at least one container
    if [ "$READY_PODS" -ge "$TOTAL_PODS" ]; then
        return 0    # All pods are running and ready
    else
        return 1    # Some pods are not ready
    fi
}

# Function to display the current pod statuses
display_pod_status() {
    echo "Current pod statuses in namespace '$NAMESPACE':"
    microk8s kubectl get pods -n "$NAMESPACE"
    echo "-------------------------------------------"
}

# Start of the script
echo "🔍 Checking OpenFaaS pod statuses in namespace '$NAMESPACE'..."
start_time=$(date +%s)

while true; do
    if check_pods_ready; then
        echo "✅ All OpenFaaS pods are running and ready."
        break
    else
        echo "⏳ Not all pods are running and ready yet. Please wait..."
        display_pod_status
    fi

    # Check for timeout
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge "$TIMEOUT" ]; then
        echo "❌ Timeout reached. Some pods are still not running or ready."
        display_pod_status
        exit 1
    fi

    # Wait before the next check
    sleep "$CHECK_INTERVAL"
done

# Initiate port-forwarding
echo "🚀 Initiating port-forward: localhost:$LOCAL_PORT -> $GATEWAY_SERVICE:$REMOTE_PORT on namespace '$NAMESPACE'..."
microk8s kubectl port-forward svc/"$GATEWAY_SERVICE" -n "$NAMESPACE" "$LOCAL_PORT":"$REMOTE_PORT"


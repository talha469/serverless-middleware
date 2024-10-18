import {
  CRDTSetType,
  CounterInitRequest,
} from '@miso/common/dist/grpc/server/common.js';
import { Inject, Injectable, Logger, Type } from '@nestjs/common';
import { BaseCrdtInitializerInterceptor } from '../../interceptor/base-crdt-initializer.interceptor.js';
import { ObjectsService } from '../../objects/objects.service.js';
import { StatefulObject } from '../../objects/stateful-object.js';
import { FunctionDiscoveryStrategy } from '../../overlay-network/discovery/serverless-function-discovery/function-discovery-strategy.interface.js';
import {
  AllowedGrpcReplicationMethods,
  GrpcClientService,
} from '../../overlay-network/transports/grpc/grpc-client.service.js';
import { GCounterService } from './GCounter.service.js';

@Injectable()
export class GCounterInterceptor extends BaseCrdtInitializerInterceptor {
  protected logger: Logger = new Logger(GCounterInterceptor.name);
  constructor(
    protected readonly objectService: ObjectsService,
    @Inject('OverlayFunctionDiscoveryService')
    protected readonly functionDiscoveryService: FunctionDiscoveryStrategy,
    protected readonly grpcClientService: GrpcClientService,
    protected readonly gCounterService: GCounterService,
  ) {
    super(objectService, functionDiscoveryService, grpcClientService);
  }
  getPayloadAndGrpcMethod(
    clazz: Type<any>,
    crdtName: string,
    statefulObject: StatefulObject,
    request: any,
  ) {
    this.logger.debug(
      "_getPayloadAndGrpcMethod, clazz: '" +
        clazz.name +
        "'" +
        " crdtName: '" +
        crdtName +
        "'",
    );
    const payload: CounterInitRequest = {
      statefulObjectBase: {
        crdtName: crdtName,
        statefulObjectId: statefulObject.id,
      },
      functionBase: {
        serverlessFunctionName: statefulObject.serverlessFunctionName,
      },
    };
    const method: AllowedGrpcReplicationMethods = 'retrieveGCounter';

    return {
      grpcMethod: method,
      payload,
    };
  }

  setRetrievedCrdtData(
    data: any,
    clazz: Type<any>,
    statefulObject: StatefulObject,
    crdSetType?: CRDTSetType,
  ) {
    this.logger.debug(
      "Setting retrieved GCounter data for crdt: '" + clazz.name + "'",
    );
    this.gCounterService.merge(data.value, statefulObject);
  }
}

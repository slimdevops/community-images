import NIO
import NIOHTTP1

class HTTPHandlers: ChannelInboundHandler {
    public typealias InboundIn = HTTPServerRequestPart
    public typealias OutboundOut = HTTPServerResponsePart
    private var handler: ((ChannelHandlerContext, HTTPServerRequestPart) -> Void)?

    func channelRead(ctx: ChannelHandlerContext, data: NIOAny) {
        let reqPart = self.unwrapInboundIn(data)
        if let handler = self.handler {
            handler(ctx, reqPart)
            return
        }
        
        switch reqPart {
        case .head(let request):
            var responseHead = HTTPResponseHead(version: request.version, status: HTTPResponseStatus.ok)
            responseHead.headers.add(name: "content-length", value: "12")
            let response = HTTPServerResponsePart.head(responseHead)
            ctx.write(self.wrapOutboundOut(response), promise: nil)
        case .body:
            break
        case .end:
            var buffer: ByteBuffer = ctx.channel.allocator.buffer(capacity: 12)
            buffer.write(staticString: "Hello World!")
            let content = HTTPServerResponsePart.body(.byteBuffer(buffer.slice()))
            ctx.write(self.wrapOutboundOut(content), promise: nil)

            let promise: EventLoopPromise<Void> = ctx.eventLoop.newPromise()
            promise.futureResult.whenComplete { ctx.close(promise: nil) }
            ctx.writeAndFlush(self.wrapOutboundOut(.end(nil)), promise: promise)
        }
    }
    
    func channelReadComplete(ctx: ChannelHandlerContext) {
        ctx.flush()
    }

}
import NIO
import NIOHTTP1

// this is the Server Part with Socket setup etc.
print("start the swift nio project")

let defaultHost = "0.0.0.0"
let defaultPort = 8080
// here come the http magic in the game
let myHelloHandler = HTTPHandlers()


// Event Loop Setup
let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
let threadPool  = BlockingIOThreadPool(numberOfThreads: 3)
threadPool.start()

// bootstrap the http Server
let bootstrap = ServerBootstrap(group: group)
    // Specify backlog and enable SO_REUSEADDR for the server itself
    .serverChannelOption(ChannelOptions.backlog, value: 256)
    .serverChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
    // Set the handlers that are applied to the accepted Channels
    .childChannelInitializer { channel in
        channel.pipeline.configureHTTPServerPipeline().then {
            channel.pipeline.add(handler: myHelloHandler)
        }
    }
    // Enable TCP_NODELAY and SO_REUSEADDR for the accepted Channels
    .childChannelOption(ChannelOptions.socket(IPPROTO_TCP, TCP_NODELAY), value:1)
    // ???
    .childChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
    .childChannelOption(ChannelOptions.maxMessagesPerRead, value:1)
    .childChannelOption(ChannelOptions.allowRemoteHalfClosure, value: true)

defer {
    try! group.syncShutdownGracefully()
    try! threadPool.syncShutdownGracefully()
}

//???
let channel = try { () -> Channel in
    return try bootstrap.bind(host: defaultHost, port: defaultPort).wait()
}()

// Shutdown process
print("Server started and listen on \(channel.localAddress!)")
try channel.closeFuture.wait()

print ("Server shoutdown")
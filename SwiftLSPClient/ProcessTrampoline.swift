public protocol ProcessProtocol: AnyObject {
	init()

	var launchPath: String? { get set }
	var arguments: [String]? { get set }
	var environment: [String : String]? { get set }
	var isRunning: Bool { get }

    var standardInput: Any? { get set }
    var standardOutput: Any? { get set }
    var standardError: Any? { get set }

	var terminationHandler: ((Process) -> Void)? { get set }

    func launch()
    func terminate()
}

#if os(macOS)
extension Foundation.Process : ProcessProtocol {}
#endif

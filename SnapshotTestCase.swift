import FBSnapshotTestCase

class SnapshotTestCase: FBSnapshotTestCase {

    var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.isHidden = false
        return window
    }()

    func verify(viewController: UIViewController, createNewSnapshot: Bool = false) {
        window.rootViewController = viewController
        verify(window, createNewSnapshot: createNewSnapshot)
    }

    func verify(_ view: UIView, createNewSnapshot: Bool = false) {
        if createNewSnapshot {
            recordMode = true
        }

        var frame: CGRect = view.frame
        if frame.size.height == 0 {
            frame.size.height = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        }
        if frame.size.width == 0 {
            let width = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
            frame.size.width = width > 0 ? width : UIScreen.main.bounds.width
        }

        view.frame = frame
        FBSnapshotVerifyView(view)
    }
}

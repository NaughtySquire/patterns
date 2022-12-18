import Foundation
import UIKit

public protocol ViewControllerFactory {
    func make() -> UIViewController
}

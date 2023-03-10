import UIKit
import PlaygroundSupport

// Необходимо переписать экран, чтоб код не нарушал принципы SOLID и использовал паттерны проектирования.
//
// На что обратить внимание:
// - Закрываем зависимости (связи между компонентами) протоколами;
// - Явное инжектирование зависимостей (через init устанавливаем зависимости компонента/объекта);
// - Распределить код по ролям, чтоб разгрузить контроллер;
//
// Дополнительно:
// - Добиться переиспользуемости экрана, используя паттерны проектирования.
// - Должна быть возможность пробросить любой сервис и получить список из другой API;

/// Настраиваем экран и его зависимости 
let factory: ViewControllerFactory = UniversityTableViewControllerFactory()
let viewController = factory.make()

viewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

/// Playground

PlaygroundPage.current.liveView = viewController

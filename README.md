# City Map - iOS application (Swift)

В данном репозитории расположены различные материалы для пошагового создания с нуля простого мобильного приложения **City Map** для платформы **iOS**, на языке программирования **Swift**.

**City Map** - мобильное приложения для просмотра базовой информации о различных городах.

### Основные функции:
- Постраничная навигация;
- Загрузка данных из сети;
- Оффлайн доступ к данным;
- Отображение городов на мировой карте.

## Для чего?

Если вас когда-либо интересовала нативная разработка для мобильных устройств на платформе **iOS** и Вы хотели бы попробовать себя в этом, то вы можете попробовать начать изучение используя материалы из данного репозитория.

## Что нужно, чтобы начать?

Для того, чтобы начать изучать нативную мобильную разработку под **iOS**, Вам понадобится:
- Компьютер, работающий под управлением операционной системы **Mac OS** (High Sierra и выше);
- Среда разработки **XCode** (версии 9.2 и выше);
- Базовые знания английского языка (для чтения материалов);
- Базовые навыки работы с [**Git**](https://try.github.io/levels/1/challenges/1);
- Базовые знания языка программирования [**Swift**](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2).

## Установка и настройка

- [Регистрация разработчика](https://developer.apple.com/register/)
- [Установка XCode](https://developer.apple.com/xcode/)

## Задания

Мы предлагаем Вам познакомиться с нативной разработкой под платформу **iOS**, путем последовательного выполнения заданий по созданию приложения **CityMap**.

### Часть 0

В рамках данного задания требуется создать новый проект с одним экраном.
При необходимости добавить к нему Splash screen, иконки и задать цветовую схему приложения.

Результат, который должен получиться: [GitHub](https://github.com/it-shark-pro/mobile-citymap-ios/tree/part0) | [Zip](https://github.com/it-shark-pro/mobile-citymap-ios/archive/part0.zip)

**Полезные материалы:**
- [Build a Basic UI](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1)
- [Icons and Images - iOS Human Interface Guidelines](https://developer.apple.com/ios/human-interface-guidelines/icons-and-images/image-size-and-resolution/)
- [Understanding Auto Layout](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1)

### Часть 1

Данное задание требует создать список элементов (не более 10) с открытием экрана с детальным описанием после нажатия на конкретным элемент списка.
Каждый элемент списка это объект класса (структуры) с некоторым набором атрибутов и методов. Объекты класса как и сам список создаются программно в рамках приложения.
Объект класса (структуры) должен содержать такие поля как `Name` и `Description`.

Результат, который должен получиться: [GitHub](https://github.com/it-shark-pro/mobile-citymap-ios/tree/part1) | [Zip](https://github.com/it-shark-pro/mobile-citymap-ios/archive/part1.zip)

**Полезные материалы:**
- [Пример результата 1](https://1drv.ms/i/s!At4OhPuAni8EhLMdETfFUnwSjuQCGg)
- [Пример результата 2](https://1drv.ms/i/s!At4OhPuAni8EhLMeXwWZ9yqw-qZFSg)
- [Create a Table View](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/CreateATableView.html#//apple_ref/doc/uid/TP40015214-CH8-SW1)
- [Implement Navigation](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ImplementNavigation.html#//apple_ref/doc/uid/TP40015214-CH16-SW1)
- [Anatomy of Constraint](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW1)
- [Working with Constraints in Interface Builder](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html#//apple_ref/doc/uid/TP40010853-CH10-SW1)

### Часть 2

В рамках данного задания требуется провести модификацию приложения полученного в [Часть 1 (Part 1)](#Часть-1) - заменить заданные вручную данные на полученные из сети в формате JSON.

Реализовать загрузку и отображение картинок (можно использовать сторонние библиотеки, к примеру [Kingfisher](http://cocoadocs.org/docsets/Kingfisher/1.1.2/)) как для каждого элемента списка, так и в рамках экрана с детальным описанием.

Приложение должно проверять наличие интернет соединения и сообщать о его отсутствии при попытке сделать запрос в сеть для загрузки данных.

Ресурс для получения данных: https://api.myjson.com/bins/7ybe5

Результат, который должен получиться: [GitHub](https://github.com/it-shark-pro/mobile-citymap-ios/tree/part2) | [Zip](https://github.com/it-shark-pro/mobile-citymap-ios/archive/part2.zip)

**Полезные материалы:**
- [Пример результата 1](https://1drv.ms/i/s!At4OhPuAni8EhLMf8hTmYTqkEtAC7g)
- [Пример результата 2](https://1drv.ms/i/s!At4OhPuAni8EhLMhIOZDoHQHBhyEbA)
- [Пример результата 2](https://1drv.ms/i/s!At4OhPuAni8EhLMgwF5eDuEoORx6eQ)
- [Collection View - Tutorial](https://www.raywenderlich.com/136159/uicollectionview-tutorial-getting-started)
- [Concurrency](https://www.raywenderlich.com/148513/grand-central-dispatch-tutorial-swift-3-part-1)
- [URLSession Tutorial](https://www.raywenderlich.com/158106/urlsession-tutorial-getting-started)
- [JSON Mapping](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [CocoaPods Tutorial](https://www.raywenderlich.com/156971/cocoapods-tutorial-swift-getting-started)


### Часть 3

В рамках данного задания требуется организовать работу с базой данных. Полученные данные в рамках [Часть 2 (Part 2)](#Часть-2) должны сохраняться в БД, а после, в ситуации с отсутствие интернет-соединения/ошибкой при загрузке данных из сети, доставаться из нее и отображаться пользователю.

**Полезные материалы:**
- [Core Data Tutorial](https://www.raywenderlich.com/173972/getting-started-with-core-data-tutorial-2)

### Часть 4

В рамках данного задания требуется добавить отдельную страницу с картой, на которой будут отображены метки городов полученных из JSON координат.

**Полезные материалы:**
- [Пример результата 1](https://1drv.ms/i/s!At4OhPuAni8EhLMiuq3ivVrtLqXDdA)
- [MapKit Tutorial](https://www.raywenderlich.com/160517/mapkit-tutorial-getting-started)

### Результат

Финальный результат доступен в [master](https://github.com/it-shark-pro/mobile-citymap-ios) ветке и в качестве [Zip-архива](https://github.com/it-shark-pro/mobile-citymap-ios/archive/master.zip).
> Для запуска приложения, не забудьте выполнить команду **pod install** в консоли, чтобы подтянуть все внешние зависимости.

## Q & A

Если у Вас возникли какие-то вопросы или предложения, как улучшить материал - [дайте нам знать](https://github.com/it-shark-pro/mobile-citymap-ios/issues/new). :trophy: :+1:

## Другие варианты решения:
Дополнительно, Вы можете ознакомиться с реализацией данного приложения для каждой отдельной платформы, на нативных для этой платформы технологиях:
- [City Map - Android - Java](https://github.com/it-shark-pro/mobile-citymap-android)
- [City Map - Universal Windows Platform - C#](https://github.com/it-shark-pro/mobile-citymap-uwp)
- [City Map - Cross-Platform (Android & iOS) - C#](https://github.com/it-shark-pro/mobile-citymap-xamarin)

# Learnify
- GitFlow
- MVVM-C
- Unit/UI/Snapshot testing
  
Привет, решили придерживаться gitFlow, но пока не так просто идет, поэтому борюсь с конфликтами, всю работу можно посмотреть на ветках, каждый делал свой экран, это так же отображено в названии ветки. Постараюсь сегодня разобраться со всеми конфликтами (ДЗ1).  
Тесты все работают, единственное, тесты страницы профиля не работают пока, потому что нет перехода на эту страницу (я прочитал, что можно выбирать откуда стартовать тесты, но пока решил не менять AppDelegate (ДЗ2). 
>#### UDP:
>Исправил все конфликты с помощью Forka, пока есть трудности состыковки, потому что делали все немного по-разному, над этим тоже поработаем
## ДЗ 1
___Хайруллин Тимур___
* Реализовал стартовый экран, главный экран с книгами.  Попытался поработать с API, но пока есть проблемы с обработкой json, можешь подсказать по модели Book, в чем может быть проблема?  Планирую для начала подтягивать книги и информацию о них с API. 
* Так же реализовал дженерик класс Dynamic для биндинга, правда сам еще не использовал (буду его применять во время подгрузки данных из сети и работе с поисковиком, который так же добавлю). В остальном работа с mvvm(-c) поставлена. 
* Поскольку у модели Book много полей и почти все опциональные, решил сделать BookBuilder для удобного общения с моделью. 
* Добавил расширения для цвета и запроса 
* Добавил SnapKit

___Факи Доосуур Дорис___
* Добавила координатор в проект (нужно будет поправить работу с логикой navStack)
* Реализовала экран логина с обработкой введенных данных. В процессе создания экрана входа в систему я использовала listeners в своем процессе входа в систему, чтобы мне было проще уведомлять мою view модель, которая затем уведомляет view о том, что кто-то пытается войти в систему. Что касается координатора, сначала мне было трудно разобраться в этом, потому что, но потом я поняла, что ошибка была из-за того, что мой startviewcontroller не был встроен в navigationviewcontroller. После исправления этого мне пришлось также инициализировать координатор в loginviewcontroller, чтобы обеспечить плавный переход.
* Добавила Swinject

___Хасаншина Язгуль___
* Добавила Lottie
* Profile screen
* Cамое легкое было подключение зависимостей. Изначально думала, что будет чучуть полегче, но это молодежное мввм меня добило. В теории все ок вроде, а на практике я попробовала и с dynamic перенести проинициализированные мок - данные, и как на паре нам показывали, но остановилась на старичках - делегейтах.
работа в команде увеличивает ответственность в разы:)

## ДЗ 2
___Хайруллин Тимур___
* Добавил Unit тесты к MainViewModel почти 100% покрытие тестами. Там есть как синхронные, так и асинхронные тесты. UI тесты на StartScreen и SnapShot тесты на MainScreen и отдельно MainTableViewCell (все они подписаны).
* Начал работать с Combine. Переделал все, что было на Dynamic под него, так же сетевой запрос на AnyPublisher, но есть пару вопросов, которые тебе в телегу написал(Изменения с Combine на главную ветку пока не сливал).

___Факи Доосуур Дорис___
* Так что все остальное у меня работало нормально, за исключением "теста пользовательского интерфейса". По какой-то неизвестной мне причине идентификатор, который я установила, не был распознан, тест продолжал завершаться неудачей в случае проверки существования "подвидов". Я решила использовать XCTAssertFalse, и тест прошел успешно (это означает, что дочерние элементы не распознаются, а "subivews", которые я пытаюсь протестировать, не найдены). Итак, я все еще работаю над тем, как устранить эту проблему.
В конце концов проблема была устранена. Тимур помог мне устранить ошибку. Тест продолжал завершаться неудачей из-за отсутствия корневого контроллера, поэтому он добавил app.button ["Next"], и теперь все работает нормально.

___Хасаншина Язгуль___
* добавила тесты к Profile Screen
* немного потыкалась с Combine (смотря на его возможности, поняла, это лучшее что было в моей жизни ^_^)
* пока проблематично визуально рассмотреть экран профиля, но он есть, правда

## ДЗ 3
___Хайруллин Тимур___
* Сделал ModuleBuilder для основных текущих контроллеров. Вещь не обязательная, но для внедрения зависимостей проставил, чтобы в координаторе не сильно светить логику работы. 
* Переписал логику работы FlowCoordinato (теперь есть 2 полноценных потока, которые также изолированны) и настроил авторизацию и выход из аккаунта, в том числе логику переходов между потоками в обе стороны. Самое главное, что теперь ни один контроллер ничего не знает про Coordinator на прямую, тем самым опять таки внедрил зависимости. 
* Полностью реализовал Firebase, в нем CRUD для пользователя и методы добавления/удаления информации о книге. Все запросы асинхронны на async await
* Сделал несколько кастомных Views (CustomtextField на SwiftUI/UIKit), loader (SwiftUI и его можно вызывать в UIKit),  поле с переключателем(SwiftUI) В процессе работы заметил, что предыдущий вариант, когда я прокидывал в координатор navController - плохая идея, потому что на главном потоке у меня все идет от UITabBarController, а на авторизации вообще только один контроллер нужен. В связи с этим решил прокидывать окно, и от него уже завязываться (насколько вообще верное решение?). Стало лучше, но если посмотреть через debug view - остается поле под контроллер, так и должно быть, или я где-то не добил? 
* Долго разбирался, как подгружать данные в тот момент, когда пользователь долистал до последней доступной ячейке. Решил отслеживать положение последней ячейке в background потоке, на моковых данных работало, но когда перешел на сетевые запросы, нашел способ поинтереснее.  
* Теперь про сами сетевые запросы - получаю реактивно по введенному запросу все доступные книги. Когда доматываю до конца, подгружаются следующие 10 штук и так далее. При пустой строке поиска отображается заданный запрос “Котики”. 
* Как я говорил ранее, реализовал сервис для работы с Firebase, там же методы удаления/добавления карточки к текущему пользователю. Функционально все работает - у каждого пользователя хранится массив id избранных книг, далее планируется доставать их в CoreData с помощью уже готового метода getCardsId. Вьюха не от меня зависит, так что, к сожалению пока только функционально могу доказать. Если нужно Firebase тоже могу скинуть. 
* Так же, что касается домашки: использовал почти все, что есть. Кроме onDisappear(), @StateObject, @Environment, @ViewBuilder (они просто не пригодились). Особенно зашел @EnvironmentObject для работы с viewModel.
 * Ну и в завершении, не хотел отправлять в ночь, потому что хотели все вместе готовые части запушить, а потом уснул аккуратно, так что надеюсь, ничего страшного, что под утро отправляем. Видно, что все кривовато выглядит, но мне SwiftUI не сильно зашел, несмотря на удобную работу с прокидыванием объектов. Мне кажется, что написание логики сильно выросло за последний месяц-полтора, хотелось твое мнение тоже услышать, спасибо!

___Факи Доосуур Дорис___

___Хасаншина Язгуль___

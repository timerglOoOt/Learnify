# Learnify
- GitFlow
- MVVM-C
  
Привет, решили придерживаться gitFlow, но пока не так просто идет, поэтому борюсь с конфликтами, всю работу можно посмотреть на ветках, каждый делал свой экран, это так же отображено в названии ветки. Постараюсь сегодня разобраться со всеми конфликтами.
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

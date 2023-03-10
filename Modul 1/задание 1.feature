#language: ru

@tree

Функционал: Создание и проверка заказа

Как администратор я хочу
создать и проверить зака

Контекст: 
дано я активизирую TestClient "Этот клиент"

Сценарий: Создание и проверка заказа
	* Создание документа
		И Я открываю навигационную ссылку "e1cib/list/Документ.Заказ"
		Когда открылось окно 'Заказы товаров'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Когда открылось окно 'Заказ (создание)'
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000002' | 'Сапоги'       |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заказ (создание) *'
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" я выбираю текущую строку
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
		И в таблице "Товары" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно 'Заказ * от *'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я запоминаю значение поля "Номер" как "$Номер$"
	* Проверка суммы
		Тогда таблица "Товары" стала равной:
			| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'     |
			| 'Сапоги' | '3 300,00' | '5'          | '16 500,00' |
		Когда открылось окно 'Заказ * от *'
		И Я закрываю окно 'Заказ * от *'
	* Проверка создания документа
		И таблица "Список" содержит строки:
			| 'Номер'     |
			| '$Номер$' |
			
						

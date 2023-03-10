#language: ru


Функционал: Проверка расчета суммы документа

Как Менеджер по закупкам я хочу
проверка расчета суммы документа 
чтобы верно рассчитывалась сумма


Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка наличия номенклатуры

	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
			| 'Наименование' |
			| 'Торт'   |



Сценарий: Проверка расчета суммы документа

	И я закрываю все окна клиентского приложения
* Создание документа Заказ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Торт'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Тогда открылось окно 'Заказ * от *'
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проверка суммы 1
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '200,00'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '200,00' | '1'          | '200,00' |
* Проверка суммы 2
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '200,00' | '2'          | '400,00' |
* Проверка суммы 3
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '200,00' | '3'          | '600,00' |
* Проверка суммы 4
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '400,00'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '400,00' | '3'          | '1 200,00' |
	И в таблице "Товары" я завершаю редактирование строки
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ * от * *' в течение 20 секунд
	
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
﻿#language: ru

@tree

Функционал: Проверка расчета поля Количество

Как Менеджер я хочу
проверить заполнение поля Количество
чтобы исключить ошибки в заказе

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	
Сценарий: Проверка расчета поля Количество

	И я закрываю все окна клиентского приложения
* Подготовка данных для теста
	И Подготовка данных
* Создание документа и заполнение шапки
	И Заполнение шапки документа Заказа
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Торт'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '200,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка поля Количество итого
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '3'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '5'
* Запоминание значения поля Номер
	И я нажимаю на кнопку "Записать"
	И я запоминаю значение поля "Номер" как "Номер"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |



	

	
		
	
		
		
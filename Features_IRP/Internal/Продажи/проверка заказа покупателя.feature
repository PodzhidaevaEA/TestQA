﻿#language: ru

@tree

Функционал: тестирование документа Заказ покупателя

Как Тестировщик я хочу
проверить документ Заказ покупателя
чтобы у пользователей не было проблем 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	
Сценарий: _0101 подготовительный 
	Когда экспорт документов продаж
	

Сценарий: _0102 Проверка заполнения полей
* Создание документа
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я активизирую поле с именем "Partner"
	И из выпадающего списка с именем "Partner" я выбираю по строке 'клиент 1 (1 соглашение)'
	И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
	И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
	И в таблице "ItemList" из выпадающего списка с именем "ItemListItem" я выбираю по строке 'Товар с характеристиками'
	И в таблице "ItemList" я активизирую поле с именем "ItemListItemKey"
	И в таблице "ItemList" из выпадающего списка с именем "ItemListItemKey" я выбираю по строке 'S/Красный'
	И в таблице "ItemList" я завершаю редактирование строки
* Сохранение документа и запоминание номера
	И я нажимаю на кнопку с именем 'FormWrite'
	И я запоминаю значение поля "Номер" как "$Номер$"
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Заказ покупателя (создание) *' в течение 20 секунд
* Переход к документу и проверка заполнения данных
	И в таблице "List" я перехожу к строке
			| 'Номер' |
			| '$Номер$' |
	И в таблице "List" я выбираю текущую строку
	И элемент формы с именем "Partner" стал равен 'Клиент 1 (1 соглашение)'
	И элемент формы с именем "LegalName" стал равен 'Клиент 1'
	И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'

* Проверка доступности поля контрагент при отсутсвии парнера
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И из выпадающего списка с именем "LegalName" я выбираю по строке 'клиент 1'
		
		
	 
	
			
		
		
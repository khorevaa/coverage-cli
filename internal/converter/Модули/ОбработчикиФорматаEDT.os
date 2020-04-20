
Перем ОбработчикиФормата;
Перем Лог;

#Область ПрограммныйИнтерфейс

Функция ОбработчикиФормата() Экспорт

	Если ОбработчикиФормата = Неопределено Тогда
		ОбработчикиФормата = НовыйОбработчикиФормата();
	КонецЕсли;	

	Возврат ОбработчикиФормата;

КонецФункции

#КонецОбласти

#Область ОбработчикиДелегатов

Функция НайтиМодульУправляемогоПриложения(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	Возврат ОбъединитьПути(ПутьКИсходнымФайлам, "Configuration", "ManagedApplicationModule.bsl");
КонецФункции

Функция НайтиОбщийМодуль(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт

	КаталогОбъектаМетаданных = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, 
		"CommonModules", ИдентификаторПрограммногоМодуля);
	
	Если КаталогОбъектаМетаданных = Неопределено Тогда
		
		ТекстСообщения = СтрШаблон("Не найден общий модуль с идентификатором ""%1""", 
			ИдентификаторПрограммногоМодуля);
		ПараметрыПриложения.Лог().Ошибка(ТекстСообщения);

		Возврат Неопределено;

	КонецЕсли;

	Возврат ОбъединитьПути(КаталогОбъектаМетаданных.ПолноеИмя, "Module.bsl");	

КонецФункции

Функция НайтиМодульМенеджера(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт

	КаталогиТиповОбъектовМетаданных = Новый Массив;
	КаталогиТиповОбъектовМетаданных.Добавить("DataProcessors");
	КаталогиТиповОбъектовМетаданных.Добавить("InformationRegisters");

	КаталогОбъектаМетаданных = НайтиОбъектМетаданныхВКаталогах(ПутьКИсходнымФайлам, 
		КаталогиТиповОбъектовМетаданных, ИдентификаторПрограммногоМодуля);
	
	Если КаталогОбъектаМетаданных = Неопределено Тогда

		ТекстСообщения = СтрШаблон("Не найден модуль менеджера с идентификатором ""%1""", 
			ИдентификаторПрограммногоМодуля);
		ПараметрыПриложения.Лог().Ошибка(ТекстСообщения);
		
		Возврат Неопределено;
	
	КонецЕсли;

	Возврат ОбъединитьПути(КаталогОбъектаМетаданных.ПолноеИмя, "ManagerModule.bsl");	

КонецФункции

Функция НайтиМодульОбъекта(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	КаталогиТиповОбъектовМетаданных = Новый Массив;
	КаталогиТиповОбъектовМетаданных.Добавить("Catalogs");
	КаталогиТиповОбъектовМетаданных.Добавить("Documents");
	КаталогиТиповОбъектовМетаданных.Добавить("DataProcessors");
	КаталогиТиповОбъектовМетаданных.Добавить("ExchangePlans");

	КаталогОбъектаМетаданных = НайтиОбъектМетаданныхВКаталогах(ПутьКИсходнымФайлам, 
		КаталогиТиповОбъектовМетаданных, ИдентификаторПрограммногоМодуля);

	Если КаталогОбъектаМетаданных = Неопределено Тогда

		ТекстСообщения = СтрШаблон("Не найден модуль объекта с идентификатором ""%1""", 
			ИдентификаторПрограммногоМодуля);
		ПараметрыПриложения.Лог().Ошибка(ТекстСообщения);

		Возврат Неопределено;
	
	КонецЕсли;
	
	Возврат ОбъединитьПути(КаталогОбъектаМетаданных.ПолноеИмя, "ObjectModule.bsl");	

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция НовыйОбработчикиФормата()

	Обработчики = Новый Соответствие;
	ДобавитьДелегата(Обработчики, 
		ВидыПрограммныхМодулей.МодульУправляемогоПриложения, "НайтиМодульУправляемогоПриложения");
	ДобавитьДелегата(Обработчики, 
		ВидыПрограммныхМодулей.ОбщийМодуль, "НайтиОбщийМодуль");
	ДобавитьДелегата(Обработчики, 
		ВидыПрограммныхМодулей.МодульОбъекта, "НайтиМодульОбъекта");
	ДобавитьДелегата(Обработчики, 
		ВидыПрограммныхМодулей.МодульМенеджера, "НайтиМодульМенеджера");
			
	Возврат Обработчики;

КонецФункции

Процедура ДобавитьДелегата(Обработчики, ВидПрограммногоМодуля, ИмяДелегата)

	Делегат = Новый Действие(ЭтотОбъект, ИмяДелегата);
	Обработчики.Вставить(ВидПрограммногоМодуля, Делегат);

КонецПроцедуры

Функция ФайлОбъектаМетаданных(КаталогОбъектаМетаданных)
	
	ФайлыМетаданных = НайтиФайлы(КаталогОбъектаМетаданных, "*.mdo");
	Если ФайлыМетаданных.Количество() = 0 Тогда
		Возврат Неопределено;
	КонецЕсли;

	Возврат ФайлыМетаданных[0];

КонецФункции

Функция ИдентификаторОбъектаМетаданных(ФайлОбъектаМетаданных)
	
	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.ОткрытьФайл(ФайлОбъектаМетаданных.ПолноеИмя);
	ЧтениеXML.ПерейтиКСодержимому();
	ИдентификаторМетаданных = ЧтениеXML.ЗначениеАтрибута("uuid");
	ЧтениеXML.Закрыть();

	Возврат ИдентификаторМетаданных;

КонецФункции

Функция НайтиОбъектМетаданныхВКаталогах(ПутьКИсходнымФайлам, КаталогиТиповОбъектовМетаданных, ИдентификаторПрограммногоМодуля)

	Результат = Неопределено;

	Для Каждого КаталогТипаОбъектовМетаданных Из КаталогиТиповОбъектовМетаданных Цикл

		Результат = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, 
			КаталогТипаОбъектовМетаданных, ИдентификаторПрограммногоМодуля);
		
		Если ТипЗнч(Результат) = Тип("Файл") Тогда
			Прервать;
		КонецЕсли;

	КонецЦикла;
	
	Возврат Результат;

КонецФункции

Функция НайтиОбъектМетаданных(ПутьКИсходнымФайлам, ПодКаталогОбъектовМетаданных, ИдентификаторПрограммногоМодуля)

	Результат = Неопределено;

	КаталогПоиска = ОбъединитьПути(ПутьКИсходнымФайлам, ПодКаталогОбъектовМетаданных);
	КаталогиОбъектовМетаданных = НайтиФайлы(КаталогПоиска, "*");
	Для Каждого КаталогОбъектаМетаданных Из КаталогиОбъектовМетаданных Цикл
		
		ФайлОбъектаМетаданных = ФайлОбъектаМетаданных(КаталогОбъектаМетаданных.ПолноеИмя);
		Если ФайлОбъектаМетаданных = Неопределено Тогда
			Продолжить;
		КонецЕсли;

		ИдентификаторОбъектаМетаданных = ИдентификаторОбъектаМетаданных(ФайлОбъектаМетаданных);
		
		Если ИдентификаторОбъектаМетаданных = ИдентификаторПрограммногоМодуля Тогда
			Результат = КаталогОбъектаМетаданных;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;

	Возврат Результат;

КонецФункции

#КонецОбласти

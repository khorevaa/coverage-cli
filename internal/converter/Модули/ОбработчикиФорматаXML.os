
#Область ОбработчикиДелегатов

Функция НайтиМодульУправляемогоПриложения(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	ФайлОбъектаМетаданных = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, ".", ИдентификаторПрограммногоМодуля);
	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденМодульУправляемогоПриложения(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат ОбъединитьПути(ПутьКИсходнымФайлам, "Ext", "ManagedApplicationModule.bsl");

КонецФункции

Функция НайтиМодульСеанса(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	ФайлОбъектаМетаданных = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, ".", ИдентификаторПрограммногоМодуля);
	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденМодульСеанса(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат ОбъединитьПути(ПутьКИсходнымФайлам, "Ext", "SessionModule.bsl");

КонецФункции

Функция НайтиОбщийМодуль(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт

	ФайлОбъектаМетаданных = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, 
		"CommonModules", ИдентификаторПрограммногоМодуля);
	
	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденОбщийМодуль(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;

	КаталогОбъектаМетаданных = КаталогОбъектаМетаданных(ФайлОбъектаМетаданных);

	Возврат ОбъединитьПути(КаталогОбъектаМетаданных, "Ext", "Module.bsl");	

КонецФункции

Функция НайтиМодульМенеджераЗначения(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	ФайлОбъектаМетаданных = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, 
		"Constants", ИдентификаторПрограммногоМодуля);

	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденМодульМенеджераЗначения(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;
	
	КаталогОбъектаМетаданных = КаталогОбъектаМетаданных(ФайлОбъектаМетаданных);
	Возврат ОбъединитьПути(КаталогОбъектаМетаданных, "Ext", "ValueManagerModule.bsl");	

КонецФункции

Функция НайтиМодульМенеджераНастроек(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	ФайлОбъектаМетаданных = НайтиОбъектМетаданных(ПутьКИсходнымФайлам, 
		"SettingsStorages", ИдентификаторПрограммногоМодуля);

	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеМодульМенеджераНастроек(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;
	
	КаталогОбъектаМетаданных = КаталогОбъектаМетаданных(ФайлОбъектаМетаданных);
	Возврат ОбъединитьПути(КаталогОбъектаМетаданных, "Ext", "ManagerModule.bsl");	

КонецФункции

Функция НайтиМодульМенеджера(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт

	КаталогиТиповОбъектовМетаданных = Новый Массив;
	КаталогиТиповОбъектовМетаданных.Добавить("ExchangePlans");
	КаталогиТиповОбъектовМетаданных.Добавить("FilterCriteria");
	КаталогиТиповОбъектовМетаданных.Добавить("SettingsStorages");
	КаталогиТиповОбъектовМетаданных.Добавить("Catalogs");
	КаталогиТиповОбъектовМетаданных.Добавить("Documents");
	КаталогиТиповОбъектовМетаданных.Добавить("Enums");
	КаталогиТиповОбъектовМетаданных.Добавить("Reports");
	КаталогиТиповОбъектовМетаданных.Добавить("DataProcessors");
	КаталогиТиповОбъектовМетаданных.Добавить("DocumentJournals");
	КаталогиТиповОбъектовМетаданных.Добавить("ChartsOfCharacteristicTypes");
	КаталогиТиповОбъектовМетаданных.Добавить("ChartsOfAccounts");
	КаталогиТиповОбъектовМетаданных.Добавить("ChartsOfCalculationTypes");
	КаталогиТиповОбъектовМетаданных.Добавить("InformationRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("AccumulationRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("AccountingRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("CalculationRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("BusinessProcesses");
	КаталогиТиповОбъектовМетаданных.Добавить("Tasks");
	
	ФайлОбъектаМетаданных = НайтиОбъектМетаданныхВКаталогах(ПутьКИсходнымФайлам, 
		КаталогиТиповОбъектовМетаданных, ИдентификаторПрограммногоМодуля);
	
	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденМодульМенеджера(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;

	КаталогОбъектаМетаданных = КаталогОбъектаМетаданных(ФайлОбъектаМетаданных);

	Возврат ОбъединитьПути(КаталогОбъектаМетаданных, "Ext", "ManagerModule.bsl");	

КонецФункции

Функция НайтиМодульОбъекта(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	КаталогиТиповОбъектовМетаданных = Новый Массив;
	КаталогиТиповОбъектовМетаданных.Добавить("ExchangePlans");
	КаталогиТиповОбъектовМетаданных.Добавить("Catalogs");
	КаталогиТиповОбъектовМетаданных.Добавить("Documents");
	КаталогиТиповОбъектовМетаданных.Добавить("Reports");
	КаталогиТиповОбъектовМетаданных.Добавить("DataProcessors");
	КаталогиТиповОбъектовМетаданных.Добавить("ChartsOfCharacteristicTypes");
	КаталогиТиповОбъектовМетаданных.Добавить("ChartsOfAccounts");
	КаталогиТиповОбъектовМетаданных.Добавить("ChartsOfCalculationTypes");
	КаталогиТиповОбъектовМетаданных.Добавить("BusinessProcesses");
	КаталогиТиповОбъектовМетаданных.Добавить("Tasks");

	ФайлОбъектаМетаданных = НайтиОбъектМетаданныхВКаталогах(ПутьКИсходнымФайлам, 
		КаталогиТиповОбъектовМетаданных, ИдентификаторПрограммногоМодуля);

	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденМодульОбъекта(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;
	
	КаталогОбъектаМетаданных = КаталогОбъектаМетаданных(ФайлОбъектаМетаданных);
	Возврат ОбъединитьПути(КаталогОбъектаМетаданных, "Ext", "ObjectModule.bsl");	

КонецФункции

Функция НайтиМодульНабораЗаписей(ПутьКИсходнымФайлам, ИдентификаторПрограммногоМодуля) Экспорт
	
	КаталогиТиповОбъектовМетаданных = Новый Массив;
	КаталогиТиповОбъектовМетаданных.Добавить("Sequences");
	КаталогиТиповОбъектовМетаданных.Добавить("InformationRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("AccumulationRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("AccountingRegisters");
	КаталогиТиповОбъектовМетаданных.Добавить("CalculationRegisters");

	ФайлОбъектаМетаданных = НайтиОбъектМетаданныхВКаталогах(ПутьКИсходнымФайлам, 
		КаталогиТиповОбъектовМетаданных, ИдентификаторПрограммногоМодуля);

	Если ФайлОбъектаМетаданных = Неопределено Тогда
		ОбработчикиФорматов.НеНайденМодульНабораЗаписей(ИдентификаторПрограммногоМодуля);
		Возврат Неопределено;
	КонецЕсли;
	
	КаталогОбъектаМетаданных = КаталогОбъектаМетаданных(ФайлОбъектаМетаданных);
	Возврат ОбъединитьПути(КаталогОбъектаМетаданных, "Ext", "RecordSetModule.bsl");	

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ИдентификаторОбъектаМетаданных(ФайлОбъектаМетаданных)
	
	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.ОткрытьФайл(ФайлОбъектаМетаданных.ПолноеИмя);
	ЧтениеXML.ПерейтиКСодержимому();
	ЧтениеXML.Прочитать();
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
	ФайлыОбъектовМетаданных = НайтиФайлы(КаталогПоиска, "*.xml");
	Для Каждого ФайлОбъектаМетаданных Из ФайлыОбъектовМетаданных Цикл

		ИдентификаторОбъектаМетаданных = ИдентификаторОбъектаМетаданных(ФайлОбъектаМетаданных);
		
		Если ИдентификаторОбъектаМетаданных = ИдентификаторПрограммногоМодуля Тогда
			Результат = ФайлОбъектаМетаданных;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция КаталогОбъектаМетаданных(ФайлОбъектаМетаданных)
	Возврат ОбъединитьПути(ФайлОбъектаМетаданных.Путь, ФайлОбъектаМетаданных.ИмяБезРасширения);
КонецФункции

#КонецОбласти

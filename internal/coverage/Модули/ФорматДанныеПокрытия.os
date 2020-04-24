
#Область ПрограммныйИнтерфейс

Функция ПрочитатьДанныеПокрытия(ФайлПокрытияJSON) Экспорт

	ДанныеПокрытия = Новый Массив;

	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.ОткрытьФайл(ФайлПокрытияJSON, КодировкаТекста.UTF8);
	ЧтениеJSON.Прочитать();

	Пока ЧтениеJSON.Прочитать() И ЧтениеJSON.ТипТекущегоЗначения = ТипЗначенияJSON.НачалоОбъекта Цикл

		ДанныеПокрытияМодуля = ПрочитатьJSON(ЧтениеJSON);

		НомераСтрок = Новый Соответствие;
		Для Каждого СтрокаПокрытия Из ДанныеПокрытияМодуля.LineNo Цикл
			НомераСтрок.Вставить(СтрокаПокрытия.lineNumber, СтрокаПокрытия.covered);
		КонецЦикла;
		ДанныеПокрытияМодуля.LineNo = НомераСтрок;

	КонецЦикла;

	ЧтениеJSON.Закрыть();

	Возврат ДанныеПокрытия;

КонецФункции

Процедура ЗаписатьДанныеПокрытия(ФайлПокрытияJSON, ДанныеПокрытия) Экспорт
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.ОткрытьФайл(ФайлПокрытияJSON);
	ЗаписьJSON.ЗаписатьНачалоМассива();

	Для каждого КлючИЗначение Из ДанныеПокрытия Цикл
		
		ДанныеПокрытияМодуля = КлючИЗначение.Значение;
		НомераСтрок = Новый Массив;
		Для Каждого КлючИЗначениеНомерСтроки Из ДанныеПокрытияМодуля.LineNo Цикл
			
			СтрокаПокрытия = Новый Структура;
			СтрокаПокрытия.Вставить("lineNumber", КлючИЗначениеНомерСтроки.Ключ);
			СтрокаПокрытия.Вставить("covered", КлючИЗначениеНомерСтроки.Значение);

			НомераСтрок.Добавить(СтрокаПокрытия);
			
		КонецЦикла;
		ДанныеПокрытияМодуля.LineNo = НомераСтрок;
		
		ЗаписатьJSON(ЗаписьJSON, КлючИЗначение.Значение);

	КонецЦикла;

	ЗаписьJSON.ЗаписатьКонецМассива();
	ЗаписьJSON.Закрыть();

КонецПроцедуры

Функция ПрочитатьДанныеПокрытияXML(ФайлПокрытияXML) Экспорт

	ДанныеПокрытия = Новый Массив;
	
	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.ОткрытьФайл(ФайлПокрытияXML);
	ЧтениеXML.ПерейтиКСодержимому();

	ОписаниеТипаБулево = Новый ОписаниеТипов("Булево");
	Пока ЧтениеXML.Прочитать() И ЧтениеXML.ЛокальноеИмя = "file" Цикл

		ДанныеПокрытияМодуля = НовыйДанныеПокрытияМодуля();
		ДанныеПокрытияМодуля.SourcePath = ЧтениеXML.ПолучитьАтрибут("path");

		Пока ЧтениеXML.Прочитать() И ЧтениеXML.ЛокальноеИмя = "lineToCover" Цикл
			
			lineNumber = ЧтениеXML.ПолучитьАтрибут("lineNumber");
			covered = ОписаниеТипаБулево.ПривестиЗначение(ЧтениеXML.ПолучитьАтрибут("covered"));
			ДанныеПокрытияМодуля.LineNo.Вставить(lineNumber, covered);

		КонецЦикла;

		ДанныеПокрытия.Добавить(ДанныеПокрытияМодуля);

	КонецЦикла;

	ЧтениеXML.Закрыть();

	Возврат ДанныеПокрытия;

КонецФункции

Функция НовыйДанныеПокрытияМодуля() Экспорт

	ДанныеПокрытияМодуля = Новый Структура;
	ДанныеПокрытияМодуля.Вставить("ModuleId",      "");
	ДанныеПокрытияМодуля.Вставить("SourcePath",    "");
	ДанныеПокрытияМодуля.Вставить("ObjectId",      "");
	ДанныеПокрытияМодуля.Вставить("PropertyId",    "");
	ДанныеПокрытияМодуля.Вставить("ModuleName",    "");
	ДанныеПокрытияМодуля.Вставить("ExtentionName", "");
	ДанныеПокрытияМодуля.Вставить("URL",           "");
	ДанныеПокрытияМодуля.Вставить("LineNo",        Новый Соответствие);	

	Возврат ДанныеПокрытияМодуля;

КонецФункции

#КонецОбласти

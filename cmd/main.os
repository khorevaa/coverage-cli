
#Использовать "../internal/cmd"
#Использовать cli

#Область Приложение

Процедура ВыполнитьПриложение()

	ИмяПриложения    = ПараметрыПриложения.ИмяПриложения();
	ВерсияПриложения = ПараметрыПриложения.ВерсияПриложения();

	Приложение = Новый КонсольноеПриложение(ИмяПриложения, 
		"Приложение для работы с покрытием кода 1С:Предприятия");
	
	Приложение.Версия("version", ВерсияПриложения);

	Приложение.ДобавитьКоманду("start", "Начать запись покрытия", Новый КомандаСтарт());
	Приложение.ДобавитьКоманду("stop", "Остановить запись покрытия", Новый КомандаСтоп());
	Приложение.ДобавитьКоманду("convert", "Конвертировать результаты покрытия", Новый КомандаКонвертировать());
	
	Приложение.Опция("d debug", Ложь, "Режим отладки")
	 	.ТБулево();

	Приложение.Запустить();
	
КонецПроцедуры

#КонецОбласти

Попытка
	ВыполнитьПриложение();
Исключение

	ИнформацияОбОшибке = ИнформацияОбОшибке();
	Сообщить(ПодробноеПредставлениеОшибки(ИнформацияОбОшибке));
	ЗавершитьРаботу(-1);

КонецПопытки;



&НаКлиенте
Процедура ПрочитатьФайл(Команда)
#Если не ВебКлиент тогда
	//TODO: Заменить присваивание на перебор файлов
	//отладка
	//ИмяФайлаХМЛ = Объект.ПутьКРасширению;
	Лимит = 10000;
	ИмяФайлаХМЛ = "D:\test\1\Documents\ПоступлениеТоваровУслуг\Forms\ФормаДокумента\Ext\Form.xml";
	Ф = Новый ЧтениеXML();
	ф.ИгнорироватьПробелы = истина;
	ф.ОткрытьФайл(ИмяФайлаХМЛ);
	ОбработаноАтрибутов = 0;
	Пока ф.Прочитать() цикл
		Если ф.ТипУзла = ТипУзлаXML.НачалоЭлемента тогда
			ИмяАтрибута = ф.ЗначениеАтрибута("name");
			ТипАтрибута = ""+Ф.Имя;
			Если НЕ ИмяАтрибута = Неопределено тогда
				ИмяАтрибутаСт = ИмяАтрибута;	
			КонецЕсли;
			ОбработаноАтрибутов = ОбработаноАтрибутов + 1;
			Если ОбработаноАтрибутов > Лимит тогда
				прервать;
			КонецЕсли;
		КонецЕсли;		
		Если ф.ТипУзла = ТипУзлаXML.Текст и (ТипАтрибута = "v8:content") тогда
			НаименованиеРусское = ф.Значение;
			стрТЧ = Объект.Результат.Добавить();
			стрТЧ.ПутьКРеквизиту = ИмяАтрибутаСт;
			стрТЧ.НаименованиеРусское = НаименованиеРусское;
		КонецЕсли;			
	КонецЦикла;		
#КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура СкопироватьХМЛПоТегам(Команда)
#Если не ВебКлиент тогда	
	ИмяФайлаХМЛ = "D:\test\1\Documents\ПоступлениеТоваровУслуг\Forms\ФормаДокумента\Ext\Form.xml";
	ИмяФайлаХМЛ2 = "D:\test\1\Documents\ПоступлениеТоваровУслуг\Forms\ФормаДокумента\Ext\Form1.xml";
	Ф = Новый ЧтениеXML();
	ф.ИгнорироватьПробелы = истина;
	ф.ОткрытьФайл(ИмяФайлаХМЛ);
	З = Новый ЗаписьXML();
	З.ОткрытьФайл(ИмяФайлаХМЛ2);
	З.ЗаписатьОбъявлениеXML();
	Пока ф.Прочитать() цикл
		З.ЗаписатьТекущий(Ф);
	КонецЦикла;	
	З.Закрыть();
#КонецЕсли
КонецПроцедуры

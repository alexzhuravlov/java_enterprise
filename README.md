Задание по Java 8 и Stream API
Сделать приложение, которое симулирует получение статистики репортов какого то абстрактного мониторинга.



Report содержит поля id, date, name, description, status



status может иметь 3 варианта значения - Green, Yellow, Red



Репорт должен генерироваться рандомно и все его поля. 



Дата должна генерироваться также рандомно. Например как за сегодняшний день, так и за прошлую неделю и месяц.

Также рандомно генерируется name и description

name можно генерировать просто как Report_1, Report_2 ...

а description - какой набор текста разной небольшой длины.

status ставится случайным.



Приложение получает репорт и помещает его в коллекцию (реализация - на ваш выбор). Можно сгенерировать например 1000 репортов



Основная задача - создать класс, который будет получать статистику по репортам.

Он должен иметь методы



Collection<Report> getReportsByStatus(Status status) получение репортов по статусу

int getReportsCountByStatus(Status status) получение количества репортов по статусу

Collection<Report> getReportsFromDate(LocalDate startDate) получение репортов начиная со стартовой даты

Collection<Report> getReportsToDate(LocalDate endDate) получение репортов до конечной даты

Collection<Report> getReportsInInterval(LocalDate startDate, LocalDate endDate) получение репортов в интервале дат

String getLastReportsLog(int lastReportsCount) - метод должен сконкатенировать date, status, name и description последних репортов с другими репортами в одну строку. Репорты и поля разделять переносом строки. Подсказка - использовать reduce



Collection<Report> - реализация на ваш выбор



Использовать Stream API для получения статистики

Цель: реализовать кликер, в котором если выбрана светлая тема то, прибавляется по +1, если тёмная тема прибавляется +2. Реализовать список нажатий и при какой теме это было реализовано. Всё должно находиться на одном экране.
Ход работы:
Для начала надо установить Cubit. Для этого перехожу в EXTENSIONS и устанавливаю bloc:
 ![image](https://user-images.githubusercontent.com/97626203/205564532-227e027e-a36f-47e0-8c73-57fde8e44428.png)

Рисунок 25 – Установка
Теперь перехожу в проект и переношу ссылку в проект, чтобы было всё установлено в нём:
 ![image](https://user-images.githubusercontent.com/97626203/205564582-69dcaf98-32d7-43ca-a68c-b05b2491449e.png)

Рисунок 26 – Добавление зависимости
Теперь создаю новые кубиты для кликера. Мне необходим кубит кликера, кубит для смены темы и state для сохранения информации:
 ![image](https://user-images.githubusercontent.com/97626203/205564636-5fd21429-66fe-459a-9d05-00e2ba21b653.png)

Рисунок 27 – Кубиты и state
В clicker_state я буду сохранять нажатия и список действий с помощью листа:
 ![image](https://user-images.githubusercontent.com/97626203/205564650-c2b2f693-bb7c-42d4-a51d-d77e6b8380c6.png)

Рисунок 28 – Данные
В clicker_cubit я реализую подсчёт, логи т.к наследую их из clicker_state, а так-же реализую нажатия и добавления логов в список в зависимости от темы, которая определяется переменной bool:
 ![image](https://user-images.githubusercontent.com/97626203/205564660-3b2ae55c-3f76-4e9b-aec1-a18282786370.png)

Рисунок 29 – Clicker_cubit
Для смены темы есть отдельный cubit, который переключает темы:
 ![image](https://user-images.githubusercontent.com/97626203/205564668-044265b0-e7b4-4f97-81cd-2cc301c8ca6c.png)

Рисунок 30 – Изменение темы
Теперь в maid я настраиваю build для использования кубитов: 
 ![image](https://user-images.githubusercontent.com/97626203/205564678-5c3a239e-db99-4678-a799-e751ce65f4b3.png)

Рисунок 31 – Настройка build
После начинаю настраивать вёрстку. Так для использования cubit нужно использовать BlocBuild и в нём встраивать cubit, state и прописывать кто, что может и что выводит:
 ![image](https://user-images.githubusercontent.com/97626203/205564691-5c43ad55-bd22-4e50-aa5f-9d2d77af3b2a.png)

Рисунок 32 – Отображение для кликера
 ![image](https://user-images.githubusercontent.com/97626203/205564694-531d294e-0216-4ddb-8b0b-a38ab700cf8a.png)

Рисунок 33 – Кнопки действий
 ![image](https://user-images.githubusercontent.com/97626203/205564707-77948434-e03a-44f2-9bbf-5539c73f1c0d.png)

Рисунок 34 – Отображение логов

Реализация сохранения в SharedPreferences:
 ![image](https://user-images.githubusercontent.com/97626203/205919997-2ef00260-9377-483c-a6b6-2487d05a49b7.png)

Рисунок 35 – Сохранение
Удаление из SharedPreferences сделано через добавление новой кнопки и метод для неё:
 
 ![image](https://user-images.githubusercontent.com/97626203/205919955-8fc4873b-e78a-4ccb-bc84-d8e0fe920e81.png)

Рисунок 36 – Новая кнопка
 ![image](https://user-images.githubusercontent.com/97626203/205920024-6ccf4888-d0c5-41a0-a2ce-470110094246.png)

Рисунок 37 – Очищение данных
Таймер реализован через Timer и инициируется в конструкторе:
 ![image](https://user-images.githubusercontent.com/97626203/205920039-dd2b54c5-5c73-4121-aa6a-80a794ea324d.png)

Рисунок 38 - Таймер


Результат работы программы:
 ![image](https://user-images.githubusercontent.com/97626203/205564723-34f8aa11-32f2-4f03-8e49-739f78dbf959.png)

Рисунок 35 – Результат работы программы
Вывод: в ходе выполнения данной практической работы, получил навыки по работе с cubit, изменение темы и работе с листами в dart.

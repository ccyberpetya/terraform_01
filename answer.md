# Задание №1

## 1.1
![Валидация терраформ](screen/terr-v.png)

---

## 1.2
Допустимо хранить личную и секретную информацию в файле `personal.auto.tfvars`. Этот файл не будет отправлен в git и останется только на локальной машине.

---

## 1.3
![Результат](screen/result.png)

---

## 1.4
Ошибки в конфигурации:
* Ошибка в `name = "example_${random_password.random_string_FAKE.resulT}"`: неверно задано имя ресурса `"random_string_FAKE"` и опечатка в атрибуте `"resulT"`.
* `resource "docker_container" "1nginx"` - исправлено на `resource "docker_container" "nginx"` (имя ресурса не может начинаться с цифры).
* `resource "docker_image" { ... }` - добавлено недостающее имя: `resource "docker_image" "nginx" { ... }`.

![Ошибки в main.tf](screen/error_main.png)

---

## 1.5
При применении флага `-auto-approve` все изменения происходят без дополнительного подтверждения. В следствии этого можно не заметить ошибки или случайно удалить данные и ресурсы.

![Hello World](screen/hello_world.png)

---

## 1.6
Результат уничтожения созданных ресурсов
![Удаление ресурсов](screen/remove_resurces.png)

---

## 1.7
Образ не был удален из-за параметра `keep_locally = true`.
*   `keep_locally` (логическое значение): если `true`, то образ Docker не будет удален при операции `destroy` (уничтожение). Если `false`, то образ будет удален из локального хранилища Docker.

Ссылка на документацию: [https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally)

---

# Задание №2

## Вывод запущенных контейнеров
![docker ps](screen/docker_ps_task2.png)

---

## Вывод переменных окружения (env)
![env](screen/env.png)
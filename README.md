# ci-cd-sample

[![CI status](https://github.com/Winnie-the-Pooh2019/ci-cd-sample/actions/workflows/ci.yaml/badge.svg)](https://github.com/Winnie-the-Pooh2019/ci-cd-sample/actions/workflows/ci.yaml)

Мини-приложение на Kotlin, используемое для демонстрации настройки CI/CD. Workflow собирает проект в JAR, запускает модульные и end-to-end тесты, анализирует код через CodeQL и загружает артефакт сборки.

## Полезные команды
- `bash scripts/build.sh` — сборка исполняемого `out/app.jar`.
- `bash scripts/build-test.sh && bash scripts/run-test.sh` — компиляция и запуск JUnit тестов.
- `bash test.sh` — end-to-end тест, который проверяет CLI вывод.
- `bash scripts/run.sh` — запуск приложения в консоли.

## Telegram оповещения
Для получения сообщений о падении пайплайна добавьте в Secrets репозитория `TELEGRAM_BOT_TOKEN` и `TELEGRAM_CHAT_ID`. Workflow автоматически отправит ссылку на упавший запуск в указанный чат.

# Gradework
## Что необходимо для сдачи задания?

Репозиторий со всеми Terraform манифестами и готовность продемонстрировать создание всех ресурсов с нуля.
Репозиторий со всеми Ansible ролями и готовность продемонстрировать установку всех сервисов с нуля.
Скриншоты веб-интерфейсов всех сервисов работающих по HTTPS на вашем доменном имени.
https://www.you.domain (WordPress)
https://gitlab.you.domain (Gitlab)
https://grafana.you.domain (Grafana)
https://prometheus.you.domain (Prometheus)
https://alertmanager.you.domain (Alert Manager)
Все репозитории рекомендуется хранить на одном из ресурсов (github.com или gitlab.com).
 
 Репозиторий с дипломной работой:
 https://github.com/Hroozt/gradework

## Комментарии к выполнению

### Домен

1) Зарегистрирован на рег.ру
2) Через Letsencrypt получен Сертификат, далее в роли reverse-proxy режим letsencrypt  переведен в ```--dry-run```


![letsencrypt](https://user-images.githubusercontent.com/92970717/197700721-b525e848-3270-49eb-b545-4e65c727d8ee.png)

### Terraform

  https://github.com/Hroozt/gradework/tree/main/terraform
  
1) Вся инфраструктура поднимается Терраформом. Предварительно требуеется создать Бакет и сервис аккаунт, и выдать ему права.
2) Терраформ генерирует зоны в CloudDNS, поэтому требуется делегирование домена на сервера Яндекса.
    Делегирование происходит долго с Reg.ru, а так как инфраструктура часто пересоздавалась часто и в сжатые сроки зона переписывалась руками на REG.RU чтобы LetsEncrypt мог нормально получать сертификаты. Но фукциона генерации записей сохранен.
3) Терраформ так же генерирует файлик для Ansible со списком IP адресов хостов.
    Результат выполнения приведен тут: https://github.com/Hroozt/gradework/blob/main/terraform.md
### Ansible

   https://github.com/Hroozt/gradework/tree/main/ansible


1) Созданы роли в соответствии со списком. Все поднимается Автоматический. Конфигурация сервисов происходит при помощи шаблонов jinja
2) Некоторые роли были взяты с ansible-galaxy и доработаны под собственную инфраструктуру и задачи.
3) Для выполнения роли по созданию кластера MySQL используется коллекция community.mysql для создание пользователей и SQL запросов.

### GitLab-server \ GItlab runner

1) Установлен настроеи и используется gitlab-ce
2) На отдельном сервере криутиться ранер, который настроен на тег "runner". Для корректной работы дополнительно требуется генерация ключа на сервере с ранером и размещения откртой части на сервере приложения (wordpress). Иначе ранер не может выполнить пайплайн.
3) Написан пайплайн на создание файлика info.php в каталоге wordpress:

pipeline
```terminal
stages:
  - deploy
  
deploy-stage:
  stage: deploy
  tags:
        - runner
  script:
        - ssh -o StrictHostKeyChecking=no ubuntu@application " echo '<?php phpinfo(); ?>' > /var/www/html/wordpress/info.php"
```

После выполнения пайплайна 

![git](https://user-images.githubusercontent.com/92970717/197937959-6bd8fffc-8d53-4bfa-ab68-48bd81746a45.png)


можно открыть файлик:

![wordpress](https://user-images.githubusercontent.com/92970717/197937834-67d9eb61-b73c-48d0-a595-a4f527404d63.png)


### Monitoring

1) Установлен стек Prometheus \ Grafana \ Alertmanager - все установлено в рамках 1 виртуальной машины.
2) nodexporter установлен на каждый сервер. 
3) Данные собоираются.
4) в Графане был использован дашборд по id 1860

![Grafana](https://user-images.githubusercontent.com/92970717/197937765-35a116c8-fb0f-41ef-87b2-0f21494e2cec.png)

![prometheus](https://user-images.githubusercontent.com/92970717/197937855-8ad09739-b625-4443-ad41-ea1fad937425.png)

![alertmanager](https://user-images.githubusercontent.com/92970717/197937864-041f49d2-99f8-4b72-aed8-bd1d31ceed42.png)


### Краткое резюме

Диплом был выполнен в сжатые сроки, в силу обстоятельств. Качественно не оформлен, но суть изложена.
Какие навыки были отработаны:
    1) Чтение документации по сервисам и использование поисковика
    2) Интенсивный траблшутинг (Большая часть работ)
    3) Чтение и адаптация чужого кода (github \ ansible galaxy)

На текущий попмент инфраструктура еще крутиться. Но при эксперементах с Пайплайнами убился wordpress. Возможно он будет недоступен =)
https://hroozt.xyz/info.php

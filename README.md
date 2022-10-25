# Gradework
## Что необходимо для сдачи задания?

Репозиторий со всеми Terraform манифестами и готовность продемонстрировать создание всех ресурсов с нуля.
Репозиторий со всеми Ansible ролями и готовность продемонстрировать установку всех сервисов с нуля.
    https://github.com/Hroozt/gradework/tree/main/ansible

Скриншоты веб-интерфейсов всех сервисов работающих по HTTPS на вашем доменном имени.
https://www.you.domain (WordPress)
https://gitlab.you.domain (Gitlab)
https://grafana.you.domain (Grafana)
https://prometheus.you.domain (Prometheus)
https://alertmanager.you.domain (Alert Manager)
Все репозитории рекомендуется хранить на одном из ресурсов (github.com или gitlab.com).
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
    Результат выполнения приведен тут: https://github.com/Hroozt/gradework/blob/main/terraform.md
### Ansible




from zenpy import Zenpy
from zenpy.lib.api_objects import CustomField, Ticket

ZENDESK_CREDENTIALS = {
    'email': 'ken@greenlight.me',
    'token': 'LqjGj7A0lXWRPODfunP2d9eranWl2XJv3g8GqeNL',
    'subdomain': 'greenlightme'
}

ticketsubject = "Test Ticket"
ticketmessage = {
    "email": "test@gmail.com",
    "phoneNumber": "9998887777",
    "userId": 999999
}


def send_to_zendesk(credentials, subject, message):
    phone_ticket_field_id = "45063747"
    fraud_group_id = "360000143154"
    phonenumber = message['phoneNumber']
    zenpy_client = Zenpy(**credentials)
    zenpy_client.tickets.create(
        Ticket(
            subject="{0}".format(subject),
            description="{0}".format(message),
            group_id="{0}".format(fraud_group_id),
            custom_fields=[CustomField(id=phone_ticket_field_id, value=phonenumber)]
        ))


if __name__ == '__main__':
    send_to_zendesk(ZENDESK_CREDENTIALS, ticketsubject, ticketmessage)

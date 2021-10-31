Postfix for forwarding only.

Setup:
- Update "YOUR_DOMAIN" in Dockerfile.
- Update email addresses in virtual.
- Build with:
  docker build -t postfix .
- Run with:
  docker run --name postfix --restart always -p 25:25 -d postfix
- Update MX record of your domain in DNS to point to the server running this container.
- Optional: If you forward to Gmail, you can also use Gmail to send email as your address - see reference #3. (In short, use Gmail's SMTP server and enable 2-factor authentication so you can generate app password for sending email using your Gmail account.)

References:
1. https://www.binarytides.com/postfix-mail-forwarding-debian/
2. https://www.frakkingsweet.com/postfix-in-a-container/
3. https://webapps.stackexchange.com/questions/66228/add-new-alias-to-gmail-without-smtp-forwarding-only-address


function msg() {
document.mailer.action = "mailto:";
mailtoandsubject = ((document.mailer.mailtoperson.options[document.mailer.mailtoperson.selectedIndex].value) + '?subject=' + document.mailer.subject.value);
}
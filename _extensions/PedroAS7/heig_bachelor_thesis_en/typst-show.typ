#show: doc => tb-report(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(author)$
  author: [$author$],
$endif$
$if(supervisor)$
  supervisor: [$supervisor$],
$endif$
$if(department)$
  department: [$department$],
$endif$
$if(program)$
  program: [$program$],
$endif$
$if(specialization)$
  specialization: [$specialization$],
$endif$
$if(client-name)$
  client-name: [$client-name$],
$endif$
$if(client-company)$
  client-company: [$client-company$],
$endif$
$if(academic-years)$
  academic-years: [$academic-years$],
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(confidential)$
  confidential: $confidential$,
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
  doc,
)

a12 = '{} is better than {}'.format('Beuatifu', 'ugly')
print(a12)
a12 = '{1} is better than {0}'.format('Implicit', 'Explicit')
print(a12)
a12 = 'My name is {name}'.format(name='takanori')
print(a12)
person = {'name': 'takanori', 'twitter': 'tak'}
a12 = 'My twitter id is {twitter}'.format_map(person)
print(a12)
words = ['spam', 'ham', 'eggs']
a12 = 'I like {0[2]}'.format(words)
print(a12)
person = {'name': 'name1', 'twitter': 'twitter1'}
a12 = 'My name is {person[name]}'.format(person=person)
print(a12)
from datetime import datetime
now = datetime.now()
a12 = 'Today is {0.year} - {0.month} - {0.day}'.format(now)
print(a12)

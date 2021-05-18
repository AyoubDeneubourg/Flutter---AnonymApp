class Notif {
  final String title;
  final String description;
  final String moreText;
  final DateTime date;

  Notif({this.title, this.description, this.moreText, this.date});
}

class NotificationsList {
  List<Notif> _items = [
    Notif(
      title: 'Welkom',
      description: 'Welkom bij GROW II',
      moreText:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit eum dolores ipsum rerum! Ducimus aspernatur nesciunt, accusamus esse cumque nemo recusandae magni qui odit eius consequatur nulla dicta ea eum officia deserunt praesentium repellendus aut perferendis doloremque? Sed temporibus deserunt esse quis ipsam aliquam cum possimus quidem accusantium porro, architecto delectus saepe nesciunt? Porro necessitatibus quisquam voluptatem. Laborum similique explicabo pariatur repellendus deleniti ipsum, voluptate soluta quae nihil eos harum consequuntur quia exercitationem sit sapiente unde provident illo voluptatem quos? Eius, sit? Assumenda fugiat vel labore perferendis quasi ipsam ab, perspiciatis eum nobis doloremque nemo pariatur nihil enim. Natus, accusantium.',
      date: DateTime.now(),
    ),
    Notif(
      title: 'Ayoub Deneubourg',
      description: 'De applicatie is gemaakt door...',
      moreText:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit eum dolores ipsum rerum! Ducimus aspernatur nesciunt, accusamus esse cumque nemo recusandae magni qui odit eius consequatur nulla dicta ea eum officia deserunt praesentium repellendus aut perferendis doloremque? Sed temporibus deserunt esse quis ipsam aliquam cum possimus quidem accusantium porro, architecto delectus saepe nesciunt? Porro necessitatibus quisquam voluptatem. Laborum similique explicabo pariatur repellendus deleniti ipsum, voluptate soluta quae nihil eos harum consequuntur quia exercitationem sit sapiente unde provident illo voluptatem quos? Eius, sit? Assumenda fugiat vel labore perferendis quasi ipsam ab, perspiciatis eum nobis doloremque nemo pariatur nihil enim. Natus, accusantium.',
      date: DateTime.now(),
    ),
  ];

  List<Notif> get items {
    return _items;
  }
}

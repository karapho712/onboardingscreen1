class StartedPageContent {
  String image;
  String title;
  String discription;

  StartedPageContent({
    this.image = '',
    this.title = '',
    this.discription = '',
  });
}

List<StartedPageContent> contents = [
  StartedPageContent(
    title: 'Testing 1',
    image: 'assets/futsal-02.svg',
    discription: "lorem impsum dolor sit amet, simply dummy text of the printing and typesetting industry.",
  ),
  StartedPageContent(
    title: 'Testing 2',
    image: 'assets/futsal-03.svg',
    discription: "lorem2 impsum dolor sit amet, simply dummy text of the printing and typesetting industry.",
  ),
  StartedPageContent(
    title: 'Testing 3',
    image: 'assets/futsal-04.svg',
    discription: "lorem2 impsum dolor sit amet, simply dummy text of the printing and typesetting industry.",
  ),
];

part of dartrocket;

class Text extends StageXL.TextField {

  final StageXL.TextFormat defTextFormat = new StageXL.TextFormat('Arial', 24,
      StageXL.Color.Black, bold: true, italic: true);

  Text(text, [StageXL.TextFormat textformat]): super() {
    this.text = text;
    if (textformat == null) {
      this.defaultTextFormat = defaultTextFormat;
    }
  }
}

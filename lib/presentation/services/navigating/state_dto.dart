class NavigationStateDto {
  bool isUnknown;
  bool isTodoForm;
  String? todoId;

  NavigationStateDto(this.isTodoForm, this.todoId, this.isUnknown);

  NavigationStateDto.home()
      : isUnknown = false,
        isTodoForm = false,
        todoId = null;

  NavigationStateDto.todoForm(this.todoId)
      : isUnknown = false,
        isTodoForm = true;

  NavigationStateDto.unknown()
      : isUnknown = true,
        isTodoForm = false,
        todoId = null;
}

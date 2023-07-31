class PagedList<T> {
  List<T> items;
  int page;
  int totalPageCount;
  int pageSize;
  int totalItemCount;

  PagedList(this.totalItemCount, this.items, this.totalPageCount, this.page, this.pageSize);
}

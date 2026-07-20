class PaginationEntity {
  final int page;
  final int total;
   int totalPages;
  final int limit;

   PaginationEntity({
    this.page = 1,
    required this.total,
    this.totalPages = 1,
    required this.limit,
  }){
    if(total%limit==0){
      totalPages=(total/limit).toInt();
    }else{

    }

  }

  
}

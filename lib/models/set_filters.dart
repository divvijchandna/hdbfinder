
class FilterRange{
  double _minSize=0.0;
  double _maxSize=double.maxFinite;
  double _minPrice=0.0;
  double _maxPrice=double.maxFinite;

  FilterRange();

  double getMaxSize(){
    return _maxSize;
  }
  double getMinSize(){
    return _minSize;
  }
  double getMinPrice(){
    return _minPrice;
  }
  double getMaxPrice(){
    return _maxPrice;
  }
  void setMaxSize(double val){
    _maxSize=val;
  }
  void setMinSize(double val ){
    _minSize=val;
  }
  void setMinPrice(double val){
    _minPrice=val;
  }
  void setMaxPrice(double val){
    _maxPrice=val;
  }



}
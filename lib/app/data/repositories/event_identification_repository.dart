import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventIdentificationRepository {
// getAll(){
//   return api.getAll();
// }
// getId(id){
//   return api.getId(id);
// }
// delete(id){
//   return api.delete(id);
// }
// edit(obj){
//   return api.edit( obj );
// }
  add(obj) => HttpProvider.to.addEventIdentification(obj);
}

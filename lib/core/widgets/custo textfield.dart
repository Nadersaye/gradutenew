import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/constants.dart';
import 'package:graduation/features/search/presentation/manager/searh_cubit.dart';
import '../../features/home/pres/views/widget/app_filter.dart';


class customtextfield extends StatelessWidget {
  const customtextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      height: 36,
      child: Center(
        child: TextFormField(
            validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter your search words, must not be empty';
        }
        return null;
      },
    
      onFieldSubmitted: (value) {
        BlocProvider.of<searchCubit >(context)
            .fetchSearchResult(name: value);
      },
          
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              FontAwesomeIcons.search,
              size: 20,
              color: Colors.orange,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(child: CustomAlertDialog());
                  },
                );
              },
              icon: Icon(
                Icons.menu,
                color: Colors.orange,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            hintText: 'home.search'.tr(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 107, 99, 99),
            ),
          ),
         
        ),
      ),
    );
  }
}
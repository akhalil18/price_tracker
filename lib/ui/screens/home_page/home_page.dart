import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/cubits/price_tracker_cubit.dart';
import 'package:price_tracker/cubits/price_tracker_state.dart';
import 'package:price_tracker/models/active_symbol.dart';

import '../../../services/services_locator/services_locator.dart';
import '../../../utils/enums/enums.dart';
import '../../widgets/custom_drop_down.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PriceTrackerCubit>(
      create: (context) => sl<PriceTrackerCubit>()..connect(),
      lazy: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Price Tracker',
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<PriceTrackerCubit, PriceTrackerState>(
            builder: (context, state) {
              if (state.marketsRequestStatus.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.marketsRequestStatus.isFailure) {
                return const Center(
                  child: Text('Something went wrong, please try again '),
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDropDown<String?>(
                      value: state.selectedMarket,
                      items: state.markets
                          .map(
                            (m) => DropdownMenuItem(
                              value: m,
                              child: Text(m),
                            ),
                          )
                          .toList(),
                      onChanged:
                          context.read<PriceTrackerCubit>().onMarketchanged,
                      hint: 'Select Market',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    state.loadingSymbols
                        ? const SizedBox()
                        : CustomDropDown<ActieSymbol?>(
                            value: state.selectedSymbol,
                            items: state.symbols
                                .map(
                                  (m) => DropdownMenuItem(
                                    value: m,
                                    child: Text(m.displayName),
                                  ),
                                )
                                .toList(),
                            onChanged: context
                                .read<PriceTrackerCubit>()
                                .onSelectSymbol,
                            hint: 'Select Symbol',
                          ),
                    const SizedBox(
                      height: 50,
                    ),
                    state.priceRequestStatus == DataStatus.loading
                        ? const SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(),
                          )
                        : Visibility(
                            visible: state.price != null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Price",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  state.price?.toString() ?? '',
                                  style: TextStyle(
                                      color: _getColor(state.priceStatus),
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              );
            },
          )),
    );
  }

  Color _getColor(PriceStatus status) {
    if (status == PriceStatus.increase) {
      return Colors.green;
    } else if (status == PriceStatus.decrease) {
      return Colors.red;
    }
    return Colors.grey;
  }
}

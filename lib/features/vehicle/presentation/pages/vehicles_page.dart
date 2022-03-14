import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:appmotors/features/vehicle/presentation/cubit/vehicle_cubit.dart';
import 'package:appmotors/features/vehicle/presentation/pages/vehicle_detail_page.dart';
import 'package:appmotors/features/vehicle/presentation/widgets/vehicle_item.dart';
import 'package:appmotors/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  final _pagingController = PagingController<int, Vehicle>(firstPageKey: 1);
  late VehicleCubit _vehicleCubit;
  int page = 1;
  @override
  void initState() {
    super.initState();
    _vehicleCubit = getIt<VehicleCubit>()..fetch(page: page);
    _pagingController.addPageRequestListener((page) {
      debugPrint('OnRequest => $page');
      _vehicleCubit.fetch(page: page);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _vehicleCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Veículos',
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() => BlocListener(
        bloc: _vehicleCubit,
        listener: (context, state) {
          debugPrint('State => $state');

          if (state is VehicleError) {
            _pagingController.error =
                'Error ao carregar veículos, por favor puxe para atualizar';
          } else if (state is VehiclesLoaded) {
            debugPrint('New vehicles...');

            final nextPageKey = page++;
            debugPrint('NextPage => $nextPageKey');

            if (state.vehicles.length < 10) {
              _pagingController.appendLastPage(state.vehicles);
            } else {
              _pagingController.appendPage(state.vehicles, nextPageKey);
            }
          }
        },
        // TODO(arthur): acertar o refresh
        child: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: PagedListView.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Vehicle>(
              itemBuilder: (context, vehicle, index) => VehicleItem(
                vehicle: vehicle,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleDetailPage(
                        vehicle: vehicle,
                      ),
                    ),
                  );
                },
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 30,
            ),
          ),
        ),
      );
}

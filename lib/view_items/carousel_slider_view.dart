
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/e_books_bloc.dart';
import '../data/vos/home_screen_vo/books_vo.dart';
import '../easy_widgets/cached_network_image.dart';


class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<EBooksBloc, List<BooksVO>?>(
      selector: (_, obj) => obj.favBooks,
      shouldRebuild: (preValue, nextValue) => !identical(preValue, nextValue),//if pre and next are different the widget will rebuilt
      builder: (context, favBooks, _) {
        return Visibility(
          visible: favBooks?.isNotEmpty ?? false,
          child: CarouselSlider.builder(
            itemCount: favBooks?.length ?? 0,
            options: CarouselOptions(
                height: 260,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom),
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                width: 260,
                child: Stack(children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: EasyCachedNetworkImage(
                        img: favBooks?[index].bookImage ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
              );
            },
          ),
        );
      },
    );
  }
}
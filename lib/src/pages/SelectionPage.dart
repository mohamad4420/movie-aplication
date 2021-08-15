import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'Playvideo.dart';
import 'package:flutter/services.dart';

class SelectionPage extends StatelessWidget {
  final dynamic data;
  SelectionPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Transform.rotate(
                angle: 3.14,
                child: IconButton(
                  tooltip: "الرجوع ",
                  color: Colors.white70,
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              title: Text(
                data.name,
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              expandedHeight: MediaQuery.of(context).size.width * 0.6625,
              pinned: true,
              brightness: Brightness.dark,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: NetworkImage(data.galary),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Wrap(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            data.date + '    ' + data.rating,
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          )),
                      ReadMoreText(
                        data.description,
                        trimLines: 3,
                        colorClickableText: Colors.white60,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'المزيد',
                        trimExpandedText: 'القليل',
                        moreStyle: TextStyle(color: Colors.white60),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: IconButton(
                                splashRadius: 24,
                                onPressed: () {
                                  print("isclickd");
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white70,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                splashRadius: 24,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white70,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                splashRadius: 24,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white70,
                                )),
                          )
                        ],
                      ),
                      DefaultTabController(
                        length: 3,
                        child: TabBar(
                            tabs: [Text('Screw'), Text('You'), Text('Abodia')]),
                      ),
                      Container(height: 2, color: Colors.grey[800]),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    ' الحلقة رقم ' + (index + 1).toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    'حجوم العمالقة فتال جد والله',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PlayVideo(
                                                this.key, data.name, index)));
                                  },
                                  tileColor: Colors.white10.withOpacity(0.1),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ])
            ]))
          ],
        ),
      ),
    );
  }
}

/*

            SizedBox(
              height: 55,
              child: BlocConsumer<CategoryBloc, CategoryState>(
                listener: (context, state) {
                  if(state is CategoryError){
                    context.showSnackBar(
                      message: state.message,
                      bgColor: failedColor,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CategoryInitial || state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoryLoaded) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      itemCount: state.categoryList.length,
                      itemBuilder: (context, index) =>
                          CategoryItemBuilder(
                            onTap: () {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                            isSelected: selectedCategoryIndex == index,
                            name: state.categoryList[index].capitalizedFirst,
                          ),
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        width: 15,
                      ),
                    );
                  } else {
                    return const Center(child: Text('No Category Found!'),);
                  }
                },
              ),
            ),
 */
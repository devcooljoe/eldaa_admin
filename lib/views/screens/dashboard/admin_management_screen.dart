import 'package:eldaa_admin/views/widgets/buttons.dart';
import 'package:eldaa_admin/views/widgets/pagination.dart';
import 'package:eldaa_admin/views/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminManagementScreen extends HookConsumerWidget {
  const AdminManagementScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          top: 51.h,
          right: 24.w,
          bottom: 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roles & Privileges',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Assigned roles determine access to predefined menus and features for each admin users.',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xff667185),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 416.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: AppButton(
                          text: 'Add New User',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          prefix: SvgPicture.asset('assets/icons/user.svg'),
                          padding: EdgeInsets.symmetric(vertical: 21.h),
                          borderRadius: 12.r,
                          onPressed: () {},
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 200.w,
                        child: AppButton(
                          text: 'Create New Role',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          prefix: SvgPicture.asset('assets/icons/plus.svg'),
                          padding: EdgeInsets.symmetric(vertical: 21.h),
                          borderRadius: 12.r,
                          isOutlinedButton: true,
                          borderColor: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            32.verticalSpace,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.sp, color: Color(0xffe4e7ec)),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                    spreadRadius: -2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 3,
                        ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            left:
                                index % 4 != 0
                                    ? BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    )
                                    : BorderSide.none,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Admin Level ${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Color(0xff7E8CA0),
                                ),
                              ),
                              16.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/person-edit.svg',
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '4 Users',
                                        style: TextStyle(
                                          color: Color(0xff191A26),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TouchOpacity(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/edit.svg',
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Edit Role',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  10.verticalSpace,
                  AppPagination(),
                ],
              ),
            ),
            32.verticalSpace,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.sp, color: Color(0xffe4e7ec)),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                    spreadRadius: -2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Admin users',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 291.w,
                              height: 46.h,
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/search.svg',
                                    ),
                                  ),

                                  hintText: 'Search for user',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffA8A8A8),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    borderSide: BorderSide(
                                      color: Color(0xffd0d5dd),
                                      width: 1.sp,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    borderSide: BorderSide(
                                      color: Color(0xffd0d5dd),
                                      width: 1.sp,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            24.horizontalSpace,
                            SizedBox(
                              width: 165.w,
                              height: 46.h,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                    color: Color(0xffd0d5dd),
                                    width: 1.sp,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'All Users',
                                      style: TextStyle(
                                        color: Color(0xffA8A8A8),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/angle-down.svg',
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color(0xffE5E7EB),
                        width: 1.sp,
                      ),
                    ),
                    columnWidths: const {
                      0: FixedColumnWidth(100), // User ID
                      1: FlexColumnWidth(2), // User Name
                      2: FlexColumnWidth(2), // Role
                      3: FlexColumnWidth(3), // Department
                      4: FlexColumnWidth(2), // Status
                    },
                    children: [
                      // 🔹 Header Row
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFF8F8F8)),
                        children: const [
                          _HeaderCell("User ID"),
                          _HeaderCell("User Name"),
                          _HeaderCell("Assigned Role"),
                          _HeaderCell("Department"),
                          _HeaderCell("Activation Status"),
                        ],
                      ),

                      // 🔹 Data Rows
                      _buildRow(
                        "#28373",
                        "Kristin Watson",
                        "Super Admin",
                        "IT Security",
                        "Successful",
                      ),
                      _buildRow(
                        "#72812",
                        "Guy Hawkins",
                        "Admin",
                        "Digital",
                        "Pending",
                      ),
                      _buildRow(
                        "#67219",
                        "Theresa Webb",
                        "Admin",
                        "Customer care",
                        "Successful",
                      ),
                      _buildRow(
                        "#12926",
                        "Floyd Miles",
                        "Ops & Support",
                        "Internal Audit",
                        "Pending",
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.sp,
                    height: 1.sp,
                    color: Color(0xffd0d5dd),
                  ),
                  AppPagination(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Color(0xff515151),
        ),
      ),
    );
  }
}

TableRow _buildRow(
  String id,
  String name,
  String role,
  String dept,
  String status,
) {
  final statusColor =
      status == "Successful"
          ? Color(0xff005A37)
          : status == "Pending"
          ? Color(0xffBD983F)
          : Colors.red;

  return TableRow(
    children: [
      _DataCell(id),
      _DataCell(name, isBold: true),
      _DataCell(role),
      _DataCell(dept),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _DataCell(status, color: statusColor),
          Container(
            margin: EdgeInsets.only(right: 12.w),
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xffE4E7EC), width: 1.sp),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/3-dot.svg', height: 12.h),
            ),
          ),
        ],
      ),
    ],
  );
}

class _DataCell extends StatelessWidget {
  final String text;
  final bool isBold;
  final Color? color;
  const _DataCell(this.text, {this.isBold = false, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          color: color ?? (isBold ? Colors.black87 : Color(0xff515151)),
        ),
      ),
    );
  }
}

// Copyright (c) 2016, Denis Obydennykh. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library TemplateClient.impl;

import 'dart:async';
import 'package:SemplexClientCmn/Utils/RestAdapter.dart';
import 'package:SemplexClientCmn/Utils/HttpCommunicator/HttpBrowserCommunicator.dart';

class TemplateClient {
  HttpCommunicator _netEngine = new HttpCommunicator();
  RestAdapter _rest;

  final String _baseUrl;

  TemplateClient([this._baseUrl]) {
      _rest = new RestAdapter(_netEngine);
  }

  String get ServerUrl => _baseUrl ?? '';

  Future SaveFormInfo(int wrikeFormId, Map data) async {
    return _rest.Create('${ServerUrl}/storage/forms', data);
  }

  Future<Map> GetFormInfo(int wrikeFormId)
    => _rest.Get('${ServerUrl}/storage/forms/${wrikeFormId}');

  Future SaveTaskInfo(int wrikeFormId, int wrikeRootId, Map data) async {
    data['wroot_id'] = wrikeRootId;
    return _rest.Create('${ServerUrl}/storage/tasks', data);
  }

  Future<Map> GetTaskInfo(int wrikeFormId)
    => _rest.Get('${ServerUrl}/storage/tasks/${wrikeFormId}');

  Future<List> QueryByTaskData(String key, String value)
    => _rest.Get('${ServerUrl}/storage/tasks?${key}=${value}');

  

}

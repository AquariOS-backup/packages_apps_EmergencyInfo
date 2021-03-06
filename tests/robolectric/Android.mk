# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_JAVA_LIBRARIES := \
    junit \
    platform-robolectric-prebuilt \
    sdk_vcurrent

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-v7-preference \
    platform-system-robolectric \
    truth-prebuilt \
    emergencyinfo-test-common

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_INSTRUMENTATION_FOR := EmergencyInfo
LOCAL_MODULE := EmergencyInfoRoboTests

include $(BUILD_STATIC_JAVA_LIBRARY)

#############################################################
# EmergencyInfo runner target to run the previous target. #
#############################################################
include $(CLEAR_VARS)

LOCAL_MODULE := RunEmergencyInfoRoboTests

LOCAL_SDK_VERSION := current

LOCAL_STATIC_JAVA_LIBRARIES := \
    EmergencyInfoRoboTests

LOCAL_TEST_PACKAGE := EmergencyInfo

LOCAL_INSTRUMENT_SOURCE_DIRS := $(dir $(LOCAL_PATH))../src

include prebuilts/misc/common/robolectric/run_robotests.mk

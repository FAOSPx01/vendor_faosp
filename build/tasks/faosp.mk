# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# FAOSP OTA update package

FAOSP_TARGET_PACKAGE := $(PRODUCT_OUT)/$(FAOSP_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(FAOSP_TARGET_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(FAOSP_TARGET_PACKAGE)
	$(hide) $(SHA256) $(FAOSP_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FAOSP_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(FAOSP_TARGET_PACKAGE)" >&2

.PHONY: faosp
faosp: $(FAOSP_TARGET_PACKAGE) $(DEFAULT_GOAL)

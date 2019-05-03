/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  APIs configuration
 *****************************************/
resource "google_project_service" "project_services" {
  count                      = "${var.enable_apis ? length(var.activate_apis) : 0}"
  project                    = "${var.project_id}"
  service                    = "${element(var.activate_apis, count.index)}"
  disable_on_destroy         = "${var.disable_services_on_destroy}"
  disable_dependent_services = "${var.disable_dependent_services}"
}

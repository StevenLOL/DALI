// Copyright (c) 2017-2018, NVIDIA CORPORATION. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "dali/pipeline/operators/util/external_source.h"

namespace dali {

template<>
void ExternalSource<GPUBackend>::RunImpl(DeviceWorkspace *ws, const int idx) {
  DALI_ENFORCE(data_in_tl_, "Cannot feed non-contiguous data to GPU op.");
  auto output = ws->Output<GPUBackend>(idx);
  output->ShareData(&tl_data_);
}

DALI_REGISTER_OPERATOR(ExternalSource, ExternalSource<GPUBackend>, GPU);

}  // namespace dali

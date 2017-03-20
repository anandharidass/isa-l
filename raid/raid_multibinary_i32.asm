;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Copyright(c) 2017 IBM Corporation All rights reserved.
;
;  Redistribution and use in source and binary forms, with or without
;  modification, are permitted provided that the following conditions 
;  are met:
;    * Redistributions of source code must retain the above copyright
;      notice, this list of conditions and the following disclaimer.
;    * Redistributions in binary form must reproduce the above copyright
;      notice, this list of conditions and the following disclaimer in
;      the documentation and/or other materials provided with the
;      distribution.
;    * Neither the name of IBM Corporation nor the names of its
;      contributors may be used to endorse or promote products derived
;      from this software without specific prior written permission.
;
;  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%ifidn __OUTPUT_FORMAT__, elf64
 %define WRT_OPT		wrt ..plt
%else
 %define WRT_OPT
%endif

%include "reg_sizes.asm"
%include "multibinary.asm"

[bits 32]
	
extern pq_gen_base
extern pq_gen_sse

extern xor_gen_base
extern xor_gen_sse

extern pq_check_base
extern pq_check_sse

extern xor_check_base
extern xor_check_sse

mbin_interface xor_gen
mbin_interface pq_gen
mbin_interface xor_check
mbin_interface pq_check

mbin_dispatch_init_sse3 xor_gen, xor_gen_base, xor_gen_sse
mbin_dispatch_init_sse3 pq_gen, pq_gen_base, pq_gen_sse
mbin_dispatch_init_sse3 xor_check, xor_check_base, xor_check_sse
mbin_dispatch_init_sse3 pq_check, pq_check_base, pq_check_sse

;;;       func          	core, ver, snum
slversion xor_gen,		00,   03,  0126
slversion xor_check,		00,   03,  0127
slversion pq_gen,		00,   03,  0128
slversion pq_check,		00,   03,  0129

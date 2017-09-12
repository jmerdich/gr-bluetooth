#!/usr/bin/env python
# 
# Copyright 2013 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

from gnuradio import gr, gr_unittest, analog
import gr_bluetooth


class qa_gr_bluetooth_multi_sniffer(gr_unittest.TestCase):
    def setUp(self):
        self.tb = gr.top_block()

    def tearDown(self):
        del self.tb

    def test_runs(self):
        """
        Confirms that the code actually runs
        """
        samp_rate = 2 * 1000 * 1000 # Arbitrary
        center_freq = 2408 * 1000 * 1000 # should probably be in ISM band
        squelch = 0 
        self.tb.bluetooth_gr_bluetooth_multi_sniffer_0 = gr_bluetooth.multi_sniffer(samp_rate, center_freq, squelch, False)
        
        # toss in some random noise
        self.tb.analog_fastnoise_source_x_0 = analog.fastnoise_source_c(analog.GR_GAUSSIAN, 1, 0, 8192)
        self.tb.connect((self.tb.analog_fastnoise_source_x_0, 0), (self.tb.bluetooth_gr_bluetooth_multi_sniffer_0, 0))

        # and run
        num_samples = samp_rate * 10 # ie. 10 secs of data
        self.tb.run(num_samples)
        


if __name__ == '__main__':
    gr_unittest.run(qa_gr_bluetooth_multi_sniffer, "qa_gr_bluetooth_multi_sniffer.xml")

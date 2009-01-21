/* -*- c++ -*- */

%feature("autodoc", "1");		// generate python docstrings

%include "exception.i"
%import "gnuradio.i"			// the common stuff

%{
#include "gnuradio_swig_bug_workaround.h"	// mandatory bug fix
#include "bluetooth_sniffer.h"
#include "bluetooth_LAP.h"
#include "bluetooth_UAP.h"
#include "bluetooth_hopper.h"
#include "bluetooth_block.h"
#include "bluetooth_multi_block.h"
#include "bluetooth_tun2.h"
#include <stdexcept>
%}

// ----------------------------------------------------------------

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 */
GR_SWIG_BLOCK_MAGIC(bluetooth,sniffer);

bluetooth_sniffer_sptr bluetooth_make_sniffer (int lap, int uap);

class bluetooth_sniffer : public gr_sync_block
{
private:
  bluetooth_sniffer (int lap, int uap);
};

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 */
GR_SWIG_BLOCK_MAGIC(bluetooth,LAP);

bluetooth_LAP_sptr bluetooth_make_LAP (int x);

class bluetooth_LAP : public gr_sync_block
{
private:
  bluetooth_LAP (int x);
};

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 */
GR_SWIG_BLOCK_MAGIC(bluetooth,multi_block);

bluetooth_multi_block_sptr bluetooth_make_multi_block ();

class bluetooth_multi_block : public gr_sync_block
{
private:
  bluetooth_multi_block ();
};

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 */
GR_SWIG_BLOCK_MAGIC(bluetooth,UAP);

bluetooth_UAP_sptr bluetooth_make_UAP (int LAP);

class bluetooth_UAP : public gr_sync_block
{
private:
  bluetooth_UAP (int LAP);
};

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 */
GR_SWIG_BLOCK_MAGIC(bluetooth,hopper);

bluetooth_hopper_sptr bluetooth_make_hopper (int LAP, int channel);

class bluetooth_hopper : public gr_sync_block
{
private:
  bluetooth_hopper (int LAP, int channel);
};

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 */
GR_SWIG_BLOCK_MAGIC(bluetooth,tun2);

bluetooth_tun2_sptr bluetooth_make_tun2 (int x);

class bluetooth_tun2 : public gr_sync_block
{
private:
  bluetooth_tun2 (int x);
};

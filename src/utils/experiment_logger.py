import sys
import os
from datetime import datetime
from typing import Optional
import traceback


class ExperimentLogger:

    def __init__(self, log_file_path: str, console_output: bool = True):

        self.log_file_path = log_file_path
        self.console_output = console_output
        self.log_file = None
        self.original_stdout = None
        self.original_stderr = None
        
        # make sure the log file directory exists
        os.makedirs(os.path.dirname(log_file_path), exist_ok=True)
        
    def __enter__(self):
        """enter the context manager, start capturing output"""
        # save the original output streams
        self.original_stdout = sys.stdout
        self.original_stderr = sys.stderr
        
        # open the log file
        self.log_file = open(self.log_file_path, 'w', encoding='utf-8')
        
        # write the log file header
        self._write_log_header()
        
        # redirect the output streams
        sys.stdout = self
        sys.stderr = self
        
        return self
        
    def __exit__(self, exc_type, exc_val, exc_tb):
        """exit the context manager, restore the original output streams"""
        # restore the original output streams
        sys.stdout = self.original_stdout
        sys.stderr = self.original_stderr
        
        # write the exception information (if any)
        if exc_type:
            self._write_exception_info(exc_type, exc_val, exc_tb)
            
        # close the log file
        if self.log_file:
            self.log_file.close()
            
    def write(self, text: str):
        """write method, write to console and log file"""
        # write to the original console (if enabled)
        if self.console_output and self.original_stdout:
            self.original_stdout.write(text)
            self.original_stdout.flush()
            
        # write to the log file
        if self.log_file:
            self.log_file.write(text)
            self.log_file.flush()
            
    def flush(self):
        """flush method, ensure the output is written immediately"""
        if self.console_output and self.original_stdout:
            self.original_stdout.flush()
        if self.log_file:
            self.log_file.flush()
    
    def isatty(self):
        """Return whether this is an 'interactive' stream"""
        if self.console_output and self.original_stdout:
            return self.original_stdout.isatty()
        return False
            
    def _write_log_header(self):
        """write the log file header"""
        header = f"""
{'='*80}
🧪 EXPERIMENT LOG 
{'='*80}
📅 Start Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
📁 Log File: {self.log_file_path}
🖥️  Working Directory: {os.getcwd()}
📋 Command Line: {' '.join(sys.argv)}
{'='*80}

"""
        self.log_file.write(header)
        self.log_file.flush()
        
    def _write_exception_info(self, exc_type, exc_val, exc_tb):
        """write the exception information to the log file"""
        exception_info = f"""
{'='*80}
❌ EXPERIMENT TERMINATED WITH ERROR
{'='*80}
⏰ End Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
🚨 Exception Type: {exc_type.__name__}
📄 Exception Message: {str(exc_val)}

📋 Full Traceback:
{''.join(traceback.format_exception(exc_type, exc_val, exc_tb))}
{'='*80}
"""
        self.log_file.write(exception_info)
        self.log_file.flush()


def create_experiment_log_path(base_log_dir: str, domain: str, result_dir_suffix: str) -> str:
    log_filename = f"{domain}_{result_dir_suffix}.log"
    return os.path.join(base_log_dir, log_filename) 